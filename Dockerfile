# Imagen base ligera
FROM node:18-alpine

# Variables de entorno
ENV NODE_ENV=production
ENV PORT=3000

# Crear usuario no-root
RUN addgroup -S appgrp && adduser -S appuser -G appgrp

# Directorio de trabajo
WORKDIR /app

# Copiar sólo package.json y lock para caché de dependencias
COPY package*.json ./

# Instalar dependencias de runtime (omite dev)
RUN npm install --omit=dev

# Copiar el resto del código
COPY . .

# Cambiar propietario para el usuario no-root
RUN chown -R appuser:appgrp /app

# Exponer el puerto dentro del contenedor
EXPOSE 3000

# Ejecutar como usuario sin privilegios
USER appuser

# Comando por defecto
CMD ["npm", "start"]
