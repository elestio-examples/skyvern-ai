#set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./.streamlit
chown -R 1000:1000 ./.streamlit

cat <<EOT >  ./.streamlit/config.toml
[theme]

# The preset Streamlit theme that your custom theme inherits from.
# One of "light" or "dark".
base = "dark"
EOT
cat <<EOT > ./servers.json
{
    "Servers": {
        "1": {
            "Name": "local",
            "Group": "Servers",
            "Host": "172.17.0.1",
            "Port": 21687,
            "MaintenanceDB": "postgres",
            "SSLMode": "prefer",
            "Username": "postgres",
            "PassFile": "/pgpass"
        }
    }
}
EOT

docker-compose up -d;
docker-compose down;