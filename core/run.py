import uvicorn

def main():
    uvicorn.run('chats.app:app', port=8001)

if __name__ == '__main__':
    main()
