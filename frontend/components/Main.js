import FightScene from '../lib/FightScene'
import Player from '../lib/Player'
import Monster from '../lib/Monster'

export default class Main extends React.Component {

  shouldComponentUpdate() {
    return false
  }

  componentWillUnmount() {
    while (rootEl.firstChild) {
      rootEl.removeChild(rootEl.firstChild)
    }
  }

  render() {
    const config = {
      parent: this._rootEl,
      width: 1000,
      height: 640,
      backgroundColor: 0x0,

      render: {
        pixelArt: false,
        clearBeforeRender: false
      },

      disableContextMenu: true,

      plugins: {
        // global: [
        //   { key: "DragonBonesPlugin", plugin: dragonBones.phaser.plugin.DragonBonesPlugin, start: true } // setup DB plugin
        // ],
        scene: [
          { key: "DragonBones", plugin: dragonBones.phaser.plugin.DragonBonesScenePlugin, mapping: "dragonbone" }    // setup DB scene plugin
        ]
      },

      scene: new FightScene({player: new Player(), monster: new Monster()}),
    };

    const game = new Phaser.Game(config);
    window.game = game;

    return (
      <div ref={el => { this._rootEl = el } } />
    )
  }
}
