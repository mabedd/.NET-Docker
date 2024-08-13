# Use the official .NET 8 SDK as a build environment
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env  
WORKDIR /app

# In case of multiple projects under one solution
# Uncomment the following lines and update the paths if needed
# Copy the solution file
# COPY *.sln ./

# Copy all project files
# COPY Core/*.csproj ./Core/
# COPY Data/*.csproj ./Data/
# COPY WebAPI/*.csproj ./WebAPI/

# For single project setup
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the application files
COPY . ./

# Specify the project to publish, update name with your actual project file name
RUN dotnet publish ".NET-API-Docker.csproj" -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build-env /app/out .

# Set environment variables
ENV ASPNETCORE_URLS=http://+:5000
ENV ConnectionStrings__DefaultConnection="YourConnectionStringHere"

# Expose the port on which the app will run
EXPOSE 5000

# Start the application
ENTRYPOINT ["dotnet", ".NET-API-Docker.dll"]
