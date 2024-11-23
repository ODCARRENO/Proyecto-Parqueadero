# Usa una imagen base de Python
FROM python:3.9-slim

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia los archivos de tu proyecto al contenedor
COPY . /app

# Actualiza los paquetes del sistema y añade las dependencias necesarias
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto que Gradio usará (por defecto 7860)
EXPOSE 7860

# Define el comando de inicio
CMD ["python", "main.py"]
