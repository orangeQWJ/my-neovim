# 调用opencvAI的API
import openai
# 用于处理openAI返回的markdown文本
from rich.console import Console
from rich.markdown import Markdown
# 用于读取命令行参数
import sys
# 用于信号捕捉

# 用于显示渲染后的文本
console = Console()


openai.api_key = "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"

# 将你的对chatgpt的设定写在这里，例如：用一个小迷妹的语气和我讲话
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
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=messages
    )
    return response


def getMessages(response):
    responseMessage = response['choices'][0]["message"]["content"]
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
    console.print(md)


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
