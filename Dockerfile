# 베이스 이미지는 실행할 서버에 따라 선택
FROM --platform=linux/amd64 python:3.12.6-slim as build

# 어지간한 프로젝트에서 이 부분은 다 공통임
RUN apt-get update && \ 
    apt-get install -y --no-install-recommends && \ 
    rm -rf /var/lib/apt//lists/*

WORKDIR /usr/src/app
# 여기서 한번에 복사하면 손해인건가?
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .
EXPOSE 80
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
