# ====== Build Stage ======
FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# ====== Serve Stage ======
FROM node:18-alpine AS serve
WORKDIR /app

# ติดตั้ง http-server
RUN npm install -g http-server

# copy ไฟล์ build
COPY --from=build /app/dist .

EXPOSE 5173

# ✅ เรียก http-server จาก global path
CMD ["npx", "http-server", ".", "-p", "5173", "--proxy", "http://localhost:5173?"]
