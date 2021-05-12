FROM node:lts-alpine

WORKDIR /app

# Run as non-privileged user
RUN adduser -D -u 1001 appuser
RUN chown -R appuser /app
USER appuser

# Copy files
COPY ./package*.json /app/
RUN npm ci
COPY . .

# Run the app
CMD ["npm", "run", "start"]

EXPOSE 8080