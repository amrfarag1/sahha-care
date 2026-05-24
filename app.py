from fastapi import FastAPI
from langgraph.graph import StateGraph, MessagesState
from langchain_openai import ChatOpenAI
from langserve import add_routes
import os
from dotenv import load_dotenv

load_dotenv()

llm = ChatOpenAI(model="gpt-4o", temperature=0.7)

def agent_node(state: MessagesState):
    response = llm.invoke(state["messages"])
    return {"messages": [response]}

workflow = StateGraph(MessagesState)
workflow.add_node("agent", agent_node)
workflow.set_entry_point("agent")
workflow.set_finish_point("agent")

graph = workflow.compile()

app = FastAPI(title="Sahha Care AI Agent")

add_routes(app, graph, path="/agent")

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
