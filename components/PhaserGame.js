import 'phaser'

export default class PhaserGame extends React.Component {
  componentDidMount() {
    if (window == null) {
      return
    }

    console.log("here")

    const rootEl = this._rootEl

    const preload = () => {
      console.log("preloading")
      game.load.atlasJSONHash('bot', 'static/assets/sprites/running_bot.png', 'static/assets/sprites/running_bot.json')
    }

    const create = () => {
      //  This sprite is using a texture atlas for all of its animation data
      var bot = game.add.sprite(200, 200, 'bot')

      //  Here we add a new animation called 'run'
      //  We haven't specified any frames because it's using every frame in the texture atlas
      bot.animations.add('run')

      //  And this starts the animation playing by using its key ("run")
      //  15 is the frame rate (15fps)
      //  true means it will loop when it finishes
      bot.animations.play('run', 15, true)
    }

    const game = new Phaser.Game(800, 600, Phaser.AUTO, rootEl, { preload: preload, create: create })

    console.log("made game", game)
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
