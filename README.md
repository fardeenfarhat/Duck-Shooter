# Duck Shooter: The Simpsons-Themed Assembly Game

## Overview

Duck Shooter is a retro-inspired game written in x86 Assembly language, featuring The Simpsons. Take aim at Homer Simpson-shaped ducks, select Bart or Marge as your avatar, and climb the leaderboard by racking up points. With a blend of nostalgia and challenge, this game is a fun way to experience classic Assembly programming with a Simpsons twist.

## Features

- **Simpsons-Themed Gameplay**: Shoot Homers in a fast-paced, high-score challenge.
- **Avatar Selection**: Choose between Bart and Marge, each represented in ASCII art.
- **Leaderboard System**: Tracks and displays high scores from all players.
- **Interactive Menu**: Resume the game, return to the main menu, or exit at any time.
- **Retro Aesthetic**: Designed for DOSBox, giving it an authentic retro feel.

## How to Play

### Clone the Repository

Open your terminal or command prompt and run the following command to clone the repository:

```bash
git clone https://github.com/fardeenfarhat/Duck-Shooter
cd Duck-Shooter
```

### Set Up

Assemble and link the .asm file using MASM or a compatible assembler:

```bash
masm duckShooter.asm;
link duckShooter.obj;
```
Ensure SCORES.TXT is in the same directory as the compiled executable.

### Launch the Game

Run the executable in DOSBox or any DOS-compatible emulator:
```bash
duckShooter.exe
```

## Gameplay Instructions

- **Objective**: Shoot the Homer ducks to score points while managing your ammunition.

- **Menu Options**:
    - Resume the game.
    - Return to the main menu.
    - Exit the game.

- **Scoring**:
    - Hits increase your score, while misses waste bullets and decreases score.
    - Scores are stored in `SCORES.TXT` for persistent leaderboard tracking.
       
## Dependencies

To play the game, you’ll need the following:

  - **Git**: For cloning the repository (optional if downloading directly).
  - **Assembler**: MASM (Microsoft Macro Assembler) or compatible assembler.
  - **DOS Emulator**: DOSBox is recommended for modern systems.
  - **Operating System**: Windows, macOS, or Linux (with DOSBox installed).

### Files

  - **duckShooter.asm**
        Contains the game logic, menu handling, and sprite data for avatars and ducks.

  - **SCORES.TXT**
        Stores player names and their scores in the format:
        ```
        Name:Score
        ```
    
## Contributing

I welcome contributions to improve **Duck Shooter**! If you'd like to help enhance the game, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add new feature'`).
5. Push to the branch (`git push origin feature-name`).
6. Open a Pull Request.

Your contributions help make the game better, and I appreciate all efforts!

## Feedback

I’d love to hear what you think! Feel free to open an issue for bug reports or feature requests. Your feedback is important to me.

## Thank You for Playing!

Enjoy the game, and happy shooting! Don't forget to check out the high score leaderboard to see if you can top it!

---
**Duck Shooter** is managed by Fardeen Farhat. This project is licensed under the MIT License.
