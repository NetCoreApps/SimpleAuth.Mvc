FROM microsoft/dotnet:latest
COPY src/Mvc /app
COPY src/Mvc/deploy /app
WORKDIR /app
RUN ["dotnet", "restore"]
WORKDIR /app/Mvc
RUN ["dotnet", "build"]
EXPOSE 5000/tcp
ENV ASPNETCORE_URLS https://*:5000
ENTRYPOINT ["dotnet", "run", "--server.urls", "http://*:5000"]