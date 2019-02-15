#!/bin/bash
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html
# tail -n 200  /var/log/cloud-init-output.log
sudo yum install docker git -y
sudo service docker start
sudo usermod -a -G docker ec2-user

echo '-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAvtGwh0ZPXljzr3NkMumevPL8GJXmg7Xed7+MiY0MJngBpoB+
UZWarbfAqw23g5nP7oyr70BexfWmwUoUSB1tBVMIgmErq9zXcCoxBowlSUYeVwqG
CiFU15F4YIsv1uxz9W48MBU+mArTF09Y33WCpzHxT0FG3d2jIsSmZBiUEqi56XlW
ldGOQi8YCzw5JyNGsymyqnUuH61cv02e4y+yRk+NVC24zChvOvVO5GMmkHHKkKqR
nN4PGZHqNPYoZYEacO31OsuQDHe9N2glqcsmbX+6yUHhut8bvEDNVMkSL1VVQboZ
/GHVQ0nWzFUOHrZS+kSk51H0j+EUqk+X9olVfwIDAQABAoIBAFQ3/j6mNI+CmQL9
3eJuo+XnJIbBWj0VfvvBKgjnnM45txjCq33clqlHaZzVcAKAV3qE0bnF4k5izleP
F4aAnkZ0UFQjCQBQdzGFHaAzKJ2/edKWzXQZI/YEuWl65QFp2QAgyCW8qqS2WlZ2
adYuahza+RMuz1VK5h6JRpr1Eh1tYFZVno+jo9XBmYb5cUw0glqBZTQoxSlAg8rl
TvVGWnu/qyUUk0FagzbYESw974FKdotH7uO1q11MUb2UXShuD1+txSFuZYQnhiuQ
fufJi3Ax/LlyG+jWehsqdItC8PCfDvY/EyQYcGa/lj/mYmlRpbipwgePJ+0YWU9P
7lMIpxkCgYEA9y7vyl8DSn87yEqoH7n79vDdGeqfZjOi5G9Ptgvb/jH2z+MSvI4r
ixi8ziTE3ZoD3XawLPtJsc4+6rY/mL8UGI/woUyXJQEGNhoQ+rSP88sSiDaiLjb/
IGOvCSdLW5GXDlz/O5TpsK/pnDXMWbBFZ5sY3cQOo0YxoF/N8pPg5hsCgYEAxaAV
Z2KNRX4iVyev01DnkMP96yRykHS2eoM58ZABz+eLUARKkkRlzLZQL8gYmc9Ith2h
DgzVYR4wiK/k8KBn0pxcmJc3tgMfqHQdD24yD+YO4PVsVHYk+MYNvMyFXgJUNSnM
elAJdpmo6vb/on5+zjKmHKOuhOACHTbWqrs71G0CgYEAgvxrc5k/3DVqT6xIRW/A
Ns7Sy84KJBWO53CZFAZa0OxXNzjEkAjiyDYWr0LK1Aeurqgbmeqb1c5OhwCG2QHA
u3djc4Zrvd86FGdhwgj3E6D0NByHeugH8HkCo14gT+jp3GGpm0BBSjEeIXpczNZd
IRcOaU5g12L2H19FepuknSsCgYB+KVpAq+ugB4wIs69NagLKqjQ5nwT8L2YnBAtD
qTle7mRDatnoUn3imCjMuCLsXiX/DR86BvtZippVSGURMHXXQDbkuvS333qgYbAD
n8eZ2rZ46nSD3wBvSJCQjMg/YaE8ZzjAhMPl0ObDSXec1sBBBpiBBAVvkkoHOHEG
gY0KaQKBgCOKFcYgdZWnpb8UHrvbkvW1bPw8VSG6JVDU8fyL1tkXO+QVoHAdUncO
gL2ZN3kuE65XBgBS5hvPGOxJ+XC7q508aBz6E3sO/Didca1U2iSWs5DkPw0FqFGt
qjTNsEypUjKJbgULHM5foTyVx9B9VZ+sGNJoiUy1pYsyP3cE/763
-----END RSA PRIVATE KEY-----' > /root/.ssh/id_rsa
chmod 700 /root/.ssh/id_rsa
ssh-keyscan github.com >> /root/.ssh/known_hosts
mkdir /root/FlaskDemo
git clone git@github.com:SWEN330-201820/FlaskDemo.git /root/FlaskDemo
docker build -t prodflask:latest /root/FlaskDemo/productionContainer/
docker run -v /root/FlaskDemo/app:/app -p 80:80 --restart always --detach prodflask