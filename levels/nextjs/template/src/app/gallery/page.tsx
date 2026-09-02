import Image from "next/image";

export default function Gallery() {
  return (
    <section>
      <h1>Gallery</h1>
      <Image src="https://cdn.wurm.example/worms/hero.jpg" alt="Regenwurm" width={640} height={360} />
    </section>
  );
}
