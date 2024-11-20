import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent with TapCallbacks {
  late Vector2 tujuan; //untuk menyimpan koordinat ketika kita mengklik/tap di layar, yang akan menjadi tujuan akhir dari ship
  late Vector2 arah; //untuk menyimpan arah ke mana ship akan bergerak
  double speed = 3.0;

  Ship() {
    arah = Vector2(0, 0); // memberikan nilai awal arah, jika tidak diberi maka akan error
    tujuan = position;
  }

  void setTujuan(DragUpdateInfo info) {
    tujuan = info.eventPosition.global; //proses penyimpanan koordinat
    lookAt(tujuan);
    angle += pi;
    arah = tujuan - position;
    arah = arah.normalized(); //membuat pergerakannya per satuan
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
    position = Vector2(100, 100); //x itu lebar, y itu tinggi
    angle = -pi / 2; //berputar 90 derajat
    anchor = Anchor.center; //agar gambar berada di tengah
    // size = Vector2(100, 100); //mengubah ukuran gambar menjadi 100x100
    // scale = Vector2(1, 1); //mengubah skala gambar menjadi 2x1
  }

  @override
  void update(double dt) {
    if ((tujuan - position).length < speed) {
      position = tujuan;
      arah = Vector2(0, 0);
    }
    super.update(dt);
    position.add(arah * speed);
  }
}