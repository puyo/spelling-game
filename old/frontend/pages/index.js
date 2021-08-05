import dynamic from 'next/dynamic'

const Main = dynamic(() => import('../components/Main'), {
  ssr: false
})

export default function Home() {
  return (
    <div>
      <script type="text/javascript" src="/static/phaser-3.16.2/phaser.js"></script>
      <script type="text/javascript" src="/static/dragonbones-5.7.0/dragonBones.js"></script>
      <Main />
    </div>
    );
}
