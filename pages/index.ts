import 'phaser'

class PhaserGame extends React.Component {
  componentDidMount() {
    const rootEl = this._rootEl;

    var game = new Phaser.Game(800, 600, Phaser.AUTO, rootEl, { preload: preload, create: create });

    function preload() {
      game.load.atlasJSONHash('bot', 'assets/sprites/running_bot.png', 'assets/sprites/running_bot.json');
    }

    function create() {
      //  This sprite is using a texture atlas for all of its animation data
      var bot = game.add.sprite(200, 200, 'bot');

      //  Here we add a new animation called 'run'
      //  We haven't specified any frames because it's using every frame in the texture atlas
      bot.animations.add('run');

      //  And this starts the animation playing by using its key ("run")
      //  15 is the frame rate (15fps)
      //  true means it will loop when it finishes
      bot.animations.play('run', 15, true);
    }
  };

  shouldComponentUpdate() {
    return false;
  };

  componentWillUnmount() {
    // destroy 3rd party code here
  };

  render() {
    return (
        <div ref={el => { this._rootEl = el; }}></div>
    );
  }
};

function Home() {
  return <PhaserGame />;
}

export default Home;


class IGame extends React.Component {
  componentDidMount() {
    const config: GameConfig = {
      type: Phaser.AUTO,
      width: GAME_WIDTH,
      height: GAME_HEIGHT,
      parent: 'phaser-game',
      scene: [ExampleScene]
    }

    new Phaser.Game(config)
  }

  shouldComponentUpdate() {
    return false
  }

  public render() {
    return <div id="phaser-game" />
  }
}

class UI extends Component<IUIProps> {
  state = {
    leftOffset: 0
  }

  componentDidMount() {
    this.setState({ leftOffset: this.calculateLeftOffset() })

    window.addEventListener('resize', () => {
      this.setState({ leftOffset: this.calculateLeftOffset() })
    })
  }

  calculateLeftOffset = () => {
    return window.innerWidth / 2 - GAME_WIDTH / 2
  }

  render() {
    const { showUi } = this.props
    const { leftOffset } = this.state
    return (
      <div>
        {/* Left */}
        <div
          style={{
            position: 'absolute',
            left: leftOffset,
            width: LEFT_UI_WIDTH,
            height: GAME_HEIGHT,
            backgroundColor: 'yellow',
            opacity: 0.5
          }}
        />
        {/* Top */}
        <div>
          <Transition
            items={showUi}
            from={{ marginTop: -100 }}
            enter={{ marginTop: 0 }}
            leave={{ marginTop: -100 }}
          >
            {show =>
              show &&
              (props => (
                <div
                  style={{
                    ...props,
                    position: 'absolute',
                    width: GAME_WIDTH,
                    height: 100,
                    top: 0,
                    backgroundColor: '#fcfcfc'
                  }}
                />
              ))
            }
          </Transition>
        </div>
      </div>
    )
  }
}
