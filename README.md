# Netflix Clone – Innovative Edition

This project is a full‑stack clone of Netflix built with **React**, **TypeScript**, **Tailwind CSS**, and **Firebase**.  Beyond reproducing the familiar movie browsing and streaming interface, it introduces two unique features:

1. **Watch With Past You – Memory Lane**:  whenever you revisit a title you have watched before, an overlay timeline surfaces your past annotations, reactions, and notes.  You can mark favourite scenes while watching (e.g. by tapping a heart button), leave short notes, and later walk down memory lane as you rewatch.
2. **Emotion‑Based Recommendations**:  optional webcam access allows the app to detect your current facial expression (happy, sad, angry, etc.) using face‑api.js.  The UI then surfaces dynamic movie recommendations tailored to your mood.  All emotion processing happens locally in the browser—no video is sent to any server.

## Tech Stack

| Layer     | Technology                                   |
|-----------|----------------------------------------------|
| Frontend  | React 18 with TypeScript, Vite, Tailwind CSS |
| Backend   | Firebase (Authentication and Firestore)      |
| API       | TMDB API for movie metadata                  |
| Emotion   | face‑api.js (TensorFlow.js wrapper)          |
| Testing   | Jest + React Testing Library, Cypress        |
| Deployment| GitHub CLI + Vercel or GitHub Pages         |

## Getting Started

1. **Clone the repository**

   ```bash
   git clone https://github.com/your‑username/netflix-clone-innovative.git
   cd netflix-clone-innovative
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Firebase & TMDB setup**

   - Create a [Firebase](https://firebase.google.com/) project and enable Email/Password and Google authentication.
   - Create a Firestore database in production mode (or test mode for local development).
   - Copy `.env.example` to `.env` and fill in the Firebase configuration values from your project settings.
   - Generate an API key from [TMDB](https://www.themoviedb.org/settings/api) and add it to `.env` under `VITE_TMDB_API_KEY`.
   - Optionally adjust `VITE_FACEAPI_MODELS_URL` to point to a CDN or custom host for face‑api.js models; by default it loads from `/models` in the `public` folder.

4. **Download face‑api.js models**

   The emotion detection feature relies on pretrained models.  You can download the `tiny_face_detector` and `face_expression_model` weights from the [face‑api.js repository](https://github.com/justadudewhohacks/face-api.js/tree/master/weights) and place them in the `public/models` folder.  Alternatively, set `VITE_FACEAPI_MODELS_URL` in `.env` to point to a hosted location.

5. **Start the development server**

   ```bash
   npm run dev
   ```

   Visit `http://localhost:5173` to view the app.  You should be able to create an account or sign in with Google, browse movies, add them to **My List**, and start playback.  When you rewatch a title, your previous notes and reactions will appear on the Memory Lane timeline.

## Unique Features

### Watch With Past You – Memory Lane

When you watch a movie or show, you can tap the **💖** button or leave a short note at any time.  The app stores the timestamp, emoji reaction, and text in Firestore under your user record.  On subsequent viewings, these annotations appear in a timeline overlay, allowing you to relive your thoughts and favourite scenes.  You can also export the timeline as a shareable HTML page to reminisce with friends.

### Emotion‑Based Recommendations

Enable webcam access (optional) via the toggle on the dashboard.  Using `face‑api.js` running fully in your browser, the app classifies your facial expression in real time (happy, sad, angry, surprised, fearful, neutral).  It then requests relevant titles from the TMDB API and updates the recommendations list accordingly.  Your video stream and detected emotions are never sent to any server.

## Running Tests

- **Unit & Integration Tests** are written with Jest and React Testing Library.  Run them with:

  ```bash
  npm test
  ```

- **End‑to‑End (E2E) Tests** are scripted with Cypress.  To open the interactive Cypress runner:

  ```bash
  npm run cypress:open
  ```

  To run Cypress tests headlessly:

  ```bash
  npm run cypress:run
  ```

## Deployment

You can deploy the app to any static hosting platform that supports SPA routing.  A convenient option is [Vercel](https://vercel.com/), which integrates seamlessly with GitHub.  Alternatively, you can use GitHub Pages by configuring the `base` and `build` directories in `vite.config.ts`.

The `deploy.sh` script automates GitHub repository creation via the GitHub CLI.  It performs the following steps:

1. Initialize a new git repository.
2. Use `gh repo create netflix-clone-innovative --private --source=. --remote=origin` to create a private repository.
3. Commit all files and push to GitHub.

Ensure that the [GitHub CLI](https://cli.github.com/) is installed and authenticated on your system.  After running the script, the repository URL will be printed to your terminal.

## Screenshots

Screenshots illustrating the dashboard, Memory Lane timeline, and emotion recommendation bar should be placed in the `public/screenshots` folder.  Feel free to replace the placeholder images with your own once the app is running.

## License

This project is licensed under the MIT License.  See the [LICENSE](LICENSE) file for details.