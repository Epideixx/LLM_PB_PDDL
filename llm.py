import os
import backoff
from copy import deepcopy

import openai
from openai import OpenAI

class LLM:
    """
    Receives the natural language problem and output the translated version for the planner
    """

    def __init__(self, model = "gpt-3.5-turbo-0125", temperature = 0.0, seed = 42):

        self.openai_api_key = self.load_openai_keys()[0]
        self.messages = self._init_messages()

        self.model = model
        self.seed = seed
        self.temperature = temperature

    def _init_messages(self):
        messages = [{"role": "system", "content": "You are a computer scientist specialised in PDDL formulation who will help me doing translation between natural language and Problem PDDL."}]
        return messages
    
    def reset(self):
        self.messages = self._init_messages()
    
    def _update_messages(self, role, content):
        self.messages.append({"role" : role, "content" : content})
                        
    def load_openai_keys(self,):
        """
        Load the OpenAI API keys to use the LLM
        """
        openai_keys_file = os.path.join(os.getcwd(), "keys/openai_keys.txt")
        with open(openai_keys_file, "r") as f:
            context = f.read()
        context_lines = context.strip().split('\n')
        return context_lines

    def update_key(self):
        """Load the OpenAI API key"""
        curr_key = self.openai_api_key
        self.client = OpenAI(api_key=curr_key)

    def query(self, prompt):
        """
        Query the LLM with the given messages and messages are updated with the answer from the LLM
        """
        server_flag = 0
        server_cnt = 0
        result_text = ""
        
        self._update_messages(role="user", content=prompt)
        
        while server_cnt < 10:
            try:
                self.update_key()

                @backoff.on_exception(backoff.expo, openai.RateLimitError)
                def completions_with_backoff(**kwargs):
                    return self.client.chat.completions.create(**kwargs)
                
                # response = openai.ChatCompletion.create(
                response = completions_with_backoff(
                    model=self.model,
                    temperature=self.temperature,
                    top_p=1,
                    frequency_penalty=0,
                    presence_penalty=0,
                    messages=self.messages,
                    seed = self.seed,
                )
                result_text = response.choices[0].message.content
                server_flag = 1
                if server_flag:
                    break
            except Exception as e:
                server_cnt += 1
                print(e)
        
        self._update_messages(role="assistant", content=result_text)

        return result_text
    
    def save_discussion(self, filepath):
        with open(filepath, "w") as f:
            for msg in self.messages:
                f.write(f"{msg['role']} : {msg['content']}\n\n")
                f.write("--------------------------------------------------\n\n")

    def deepcopy(self):
        return deepcopy(self)

    
