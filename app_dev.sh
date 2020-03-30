LOGLEVEL=debug
NUMBER_OF_WORKERS=5
PORT=3000

if [ ! -z "${1}" ]; then
	PORT=${1}
fi
echo "Using port: ${PORT}"
FLASK_RUN_PORT="${PORT}"

echo "SH SQLALCHEMY_DATABASE_URI: ${SQLALCHEMY_DATABASE_URI}"

SQLALCHEMY_TRACK_MODIFICATIONS='True' SQLALCHEMY_ECHO='True' SQLALCHEMY_DATABASE_URI="${SQLALCHEMY_DATABASE_URI}" CONFIGFILE="config/local_development.py" DEBUG="${LOGLEVEL}" gunicorn --workers=${NUMBER_OF_WORKERS} --bind=0.0.0.0:${PORT} --log-level="${LOGLEVEL}" --access-logformat '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"' app:connex_app
