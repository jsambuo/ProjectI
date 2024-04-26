# ProjectI Dependency Injection Framework

ProjectI is a lightweight, robust dependency injection (DI) framework built for Swift. It aims to simplify dependency management in Swift applications, offering a clean and easy-to-use API for integrating service dependencies.

## Features

- **Efficient Dependency Injection**: Utilize a singleton DI container to manage your application's services.
- **Type-Safe**: Ensures that dependencies are resolved in a type-safe manner.
- **Simple API**: Easy to use API with `@Inject` property wrappers for automatic dependency resolution.

## Getting Started

### Installation

You can add ProjectI to your project using Swift Package Manager (SPM).

#### Swift Package Manager

Add ProjectI as a dependency to your `Package.swift`:

```swift
let package = Package(
    name: "YourPackageName",
    dependencies: [
        .package(url: "https://github.com/jsambuo/ProjectI.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "YourTargetName",
            dependencies: ["ProjectI"])
    ]
)
```

### Usage

First, import ProjectI in the file you want to use it:

```swift
import ProjectI
```

#### Registering Services

Before you can use `@Inject`, you need to register your services with the container:

```swift
DIContainer.shared.register(ExampleServiceInterface.self, service: ExampleService())
```

#### Using `@Inject` to Resolve Dependencies

Simply use the `@Inject` property wrapper to automatically inject dependencies:

```swift
class MyClass {
    @Inject var service: ExampleServiceInterface

    func performAction() {
        service.doSomething()
    }
}
```

### Error Handling

ProjectI provides error handling to manage duplicate registrations:

```swift
do {
    try DIContainer.shared.register(ExampleServiceInterface.self, service: ExampleService())
} catch DIContainerError.serviceAlreadyRegistered {
    print("This service is already registered.")
}
```

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

To contribute to ProjectI, follow these steps:

1. Fork the project.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Your Name – [@jsambuo](https://twitter.com/jsambuo) - jsambuo@gmail.com

Project Link: [https://github.com/jsambuo/ProjectI](https://github.com/jsambuo/ProjectI)
