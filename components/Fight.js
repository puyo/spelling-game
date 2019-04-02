import 'phaser'
import words from '../lib/words'

class Player {
  hp = 10
}

class Monster {
  hp = 10
}

class FightScene extends Phaser.Scene {
  constructor () {
    super('FightScene')
  }

  preload () {
    this.load.setPath('/static/assets/');
    this.load.image('bg', 'bg/castle-hallway.jpg');
    this.load.svg('boy-face', 'sprites/boy-face.svg', {width: 400, height: 400});
    this.load.atlas('bot', 'sprites/running_bot.png', 'sprites/running_bot.json')
  }

  create () {
    this.add.image(400, 300, 'bg')

    this.add.sprite(150, 400, 'boy-face')

    const bot = this.add.sprite(650, 500, 'bot').setScale(2, 2)
    const frames = this.anims.generateFrameNames('bot', { prefix: 'run', zeroPad: 2, start: 0, end: 10 })

    this.anims.create({
      key: 'run',
      frames: frames,
      frameRate: 10,
      repeat: -1
    });

    this._wordText =
      this.add.text(400, 100, '', { font: '24px Arial', fill: 'white' })
      .setDepth(1)
      .setScrollFactor(0)
      .setStroke('black', 1)
      .setFontStyle('bold')

    // this.anims.play('run', bot);

    const word = this._word = words[Math.floor(Math.random() * words.length)]
    this.load.on('filecomplete', (key, type, texture) => {
      this.add.sprite(400, 200, 'wordImage')
    }, this)
    this.load.image('wordImage', `word-images/${this._word.imageFilename}`)
    this.load.start()

    this._wordText.setText(this._word.challenge);

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

export default class Fight extends React.Component {
  componentDidMount() {
    const config = {
      type: Phaser.AUTO,
      width: 800,
      height: 600,
      parent: this._rootEl,
      scene: new FightScene({player: new Player(), monster: new Monster()}),
    };

    const game = new Phaser.Game(config);
  }

  shouldComponentUpdate() {
    return false
  }

  componentWillUnmount() {
    while (rootEl.firstChild) {
      rootEl.removeChild(rootEl.firstChild)
    }
  }

  render() {
    return (
        <div ref={el => { this._rootEl = el }}></div>
    )
  }
}
