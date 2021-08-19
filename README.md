OpenStack in Docker Container
=============================
- Sửa các biến trong file docker-compose.sh
- Chạy script để sinh ra file docker-compose.yml
- Build image base trước
```
docker-compose build base
```
- Build và tạo các container của OpenStack services
```
docker-compose up -d keystone glance nova neutron cinder horizon
```