#!/usr/bin/python3                                                                         
# 调用openai的API                                                                          
import openai                                                                              
# 用于处理openai返回的markdown文本                                                         
from rich.console import Console                                                           
from rich.markdown import Markdown                                                         
from rich.style import Style                                                               
from rich.theme import Theme                                                               
# 用于读取命令行参数                                                                       
import sys                                                                                 
                                                                                           
# 在Windows中启用彩色输出                                                                  
if sys.platform == "win32":                                                                
    import colorama                                                                        
    colorama.init()                                                                        
                                                                                           
# 用于显示渲染后的文本和代码块                                                             
theme = Theme({                                                                            
    "trans": Style(bgcolor="transparent"),                                                 
})                                                                                         
                                                                                           
console = Console(theme=theme)                                                             
                                                                                           
                                                                                           
openai.api_key = "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"                     
                                                                                           
# 将你的chatgpt的设置写在这里，例如：用一个小迷妹的语气和我讲话                            
messages = [                                                                               
    {                                                                                      
        "role": "system",                                                                  
        "content": "你是一个友善的AI助手"                                                  
    },                                                                                     
]                                                                                          
                                                                                           
# 阅读当前文件,用于代码分析                                                                
flag = False                                                                               
if len(sys.argv) > 1:                                                                      
    flag = True                                                                            
    with open(sys.argv[1], 'r') as f:                                                      
        contents = f.read()                                                                
        messages.append({                                                                  
            "role": "user",                                                                
            "content": contents + "你先看看这段代码"                                       
        })                                                                                 
                                                                                           
                                                                                           
def getResponse():                                                                         
    response = openai.Completion.create(                                                   
        model="text-davinci-002",                                                          
        prompt="\n".join([m["content"] for m in messages]),                                
        temperature=0.5,                                                                   
        max_tokens=1024,                                                                   
        top_p=1,                                                                           
        frequency_penalty=0,                                                               
        presence_penalty=0                                                                 
    )                                                                                      
    return response                                                                        
                                                                                           
                                                                                           
def getMessages(response):                                                                 
    responseMessage = response.choices[0].text                                             
    return responseMessage                                                                 
                                                                                           
                                                                                           
def addMessages(text):                                                                     
    global messages                                                                        
    messages.append({                                                                      
        "role": "user",                                                                    
        "content": text                                                                    
    })                                                                                     
                                                                                           
                                                                                           
def show(text):                                                                            
    print("🤖   ", end="")                                                                 
    md = Markdown(text)                                                                    
    console.print(md, style="trans")                                                       
                                                                                           
                                                                                           
while True:                                                                                
    # 提出问题                                                                             
    myQuestion = input("🤔   ")                                                            
    # 将出的问题添加到上下文                                                               
    addMessages(myQuestion)                                                                
    try:                                                                                   
        # 超出max token时会出错                                                            
        response = getResponse()                                                           
    except:                                                                                
        print("🤖 🤖 🤖 🤖 🤖 🤖 🤖")                                                      
        if flag:                                                                           
            messages = messages[:2]                                                        
        else:                                                                              
            messages = messages[:1]                                                        
        addMessages(myQuestion)                                                            
        print("🤖 🤖 🤖 🤖 🤖 🤖 🤖")                                                      
                                                                                           
        response = getResponse()                                                           
    responseMessage = getMessages(response)                                                
    show(responseMessage)                                                                  
    addMessages(responseMessage)                                                           
