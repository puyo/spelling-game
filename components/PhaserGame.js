import 'phaser'

export default class PhaserGame extends React.Component {
  componentDidMount() {
    if (window == null) {
      return
    }

    function preload() {
      console.log("preloading")
      this.load.atlas('bot', '/static/assets/sprites/running_bot.png', '/static/assets/sprites/running_bot.json')
    }

    function create() {
      console.log("creating")

      //  This sprite is using a texture atlas for all of its animation data
      const bot = this.add.sprite(200, 200, 'bot')

      //  Here we add a new animation called 'run'
      //  We haven't specified any frames because it's using every frame in the texture atlas
      // bot.play('run')

      //  And this starts the animation playing by using its key ("run")
      //  15 is the frame rate (15fps)
      //  true means it will loop when it finishes
      // bot.play('run', 15, true)
    }

    const update = () => {}

    const config = {
      type: Phaser.AUTO,
      width: 800,
      height: 600,
      parent: this._rootEl,
      scene: {
        preload: preload,
        create: create,
        update: update
      }
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
