from flask import Flask
from config import Config
from models import db
from routes import user_bp
from flask_migrate import Migrate


app = Flask(__name__)
app.config.from_object(Config)

db.init_app(app)
migrate = Migrate(app, db)

app.register_blueprint(user_bp)

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
