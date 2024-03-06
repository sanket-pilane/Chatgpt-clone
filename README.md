# ChatGPT Clone

## A Full-Stack Conversational AI Platform

This project is a full-stack implementation of a conversational AI platform inspired by ChatGPT. It aims to demonstrate and enhance full-stack development skills by building a server-side API and user interfaces from scratch.

### Key Features (Current):

- Robust backend server built with Node.js and TypeScript
- Intuitive mobile user interface developed using Flutter

### Future Enhancements (Planned):

- Responsive web user interface built with React.js
- Integration with a large language model (LLM) for advanced text generation and conversational capabilities (consider ethical and responsible use of LLMs)

### Project Structure:

chatgpt-clone/
```
├── backend/ # Node.js and TypeScript server code
│ ├── ... # Server-side logic, API endpoints, data models
│ └── ...
├── frontend/ # Mobile UI code (Flutter)
│ ├── mobile/ # Mobile-specific UI components, screens
│ └── ...
├── .env # Environment variables (excluded from version control)
├── package.json # Project dependencies and scripts
├── README.md # This file you're reading

```


### Technology Stack:

- Backend: Node.js, TypeScript
- Mobile UI: Flutter
- Future Web UI (Planned): React.js

### Getting Started (For Development Purposes):

#### Prerequisites:

- Node.js and npm (or yarn) installed on your system
- Flutter development environment set up (refer to official Flutter documentation for guidance)

#### Installation:

1. Clone this repository:

   ```bash
   git clone https://github.com/sanket-pilane/Chatgpt-clone.git
   ```

2. Navigate to the project directory:

```bash
cd chatgpt-clone
```
3. Install dependencies for the backend:

```bash
cd backend/
npm i
```
4. Create a .env file and paste your API KEY:

```bash
 touch .env
```

5. Run the server:

```bash
   npm run dev
```

6. Install dependencies for the frontend:

```bash
   cd frontend/mobile/
   flutter pub get
```

7. Run flutter app:

```bash
   flutter run 
```


## Contributing
This project is currently under development. Pull requests and contributions are welcome! Please review the CONTRIBUTION.md file (if you choose to create one) for guidelines on how to contribute.


## Disclaimer
The integration of a large language model (LLM) requires careful consideration of ethical and responsible use. It's crucial to ensure appropriate safeguards and responsible practices when handling such capabilities.
