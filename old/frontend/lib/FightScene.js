import words from '../lib/words'

export default class FightScene extends Phaser.Scene {
  constructor () {
    super('FightScene')
  }

  preload () {
    this.load.setPath('/static/assets/');
    this.load.image('bg', 'bg/castle-hallway.jpg');
    this.load.svg('boy-face', 'sprites/boy-face.svg', {width: 400, height: 400});

    this.load.dragonbone(
      "fire_imp",
      "sprites/fire-imp_tex.png",
      "sprites/fire-imp_tex.json",
      "sprites/fire-imp_ske.json"
    );
  }

  create () {
    const bg = this.add.image(this.cameras.main.centerX, this.cameras.main.centerY, 'bg')
    bg.setDisplaySize(this.game.config.width, this.game.config.height);

    this.add.sprite(150, 400, 'boy-face')

    this._wordText =
      this.add.text(this.cameras.main.centerX, 100, '', { font: '24px Arial', fill: 'white' })
      .setDepth(1)
      .setScrollFactor(0)
      .setStroke('black', 1)
      .setFontStyle('bold')

    const word = this._word = words[Math.floor(Math.random() * words.length)]
    this.load.on('filecomplete', (key, type, texture) => {
      this.add.sprite(this.cameras.main.centerX, 200, 'wordImage')
    }, this)
    this.load.image('wordImage', `word-images/${this._word.imageFilename}`)
    this.load.start()

    this._wordText.setText(this._word.challenge);
    this._wordText.x = (this.game.config.width - this._wordText.width) * 0.5;

    const armature = this.add.armature("fire_imp", "fire_imp");
    armature.animation.play("stand");
    armature.x = this.cameras.main.centerX + 300;
    armature.y = this.cameras.main.centerY + 200;

    // this._events = new Phaser.Events.EventEmitter()
    // this._events.on('playerTurn', this.playerTurn, this)
    // this._events.emit('playerTurn')
  }

  update () {
  }

  // playerTurn() {
  //   this._word = words[Math.floor(Math.random() * words.length)]
  //   this.load.image('wordImage', `/static/assets/word-images/${this._word.imageFilename}`)
  //   this.add.sprite(650, 500, 'wordImage')
  //   this._wordText.setText(this._word.challenge);
  // }
}
