from pydantic_settings import BaseSettings

class AppConfig(BaseSettings):
    """
    Configuration settings for the Flask application.
    This class uses Pydantic for settings management and allows for
    environment variable overrides.
    """
    # Database configuration
    POSTGRES_URL: str = "localhost"
    POSTGRES_PORT: int = 5432
    POSTGRES_USER: str = "flask_user"
    POSTGRES_PASSWORD: str = "flask_password"
    POSTGRES_DB: str = "flask_db"

    # Flask
    DEBUG: bool = True
    SECRET_KEY: str = "your_secret_key"
    HOST: str = "0.0.0.0"
    PORT: int = 5000

    class Config:
        env_prefix = ""  # Prefix for environment variables
        env_file = ".env"  # Load environment variables from a .env file if available

    @property
    def _sqlalchemy_database_uri(self) -> str:
        return f"postgresql+psycopg2://{self.POSTGRES_USER}:{self.POSTGRES_PASSWORD}@{self.POSTGRES_URL}:{self.POSTGRES_PORT}/{self.POSTGRES_DB}"

    def dict(self):
        data = super().dict()
        data["SQLALCHEMY_DATABASE_URI"] = self._sqlalchemy_database_uri
        return data

config = AppConfig()
