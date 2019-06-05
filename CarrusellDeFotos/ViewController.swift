//
//  ViewController.swift
//  CarrusellDeFotos
//
//  Created by User on 14/02/2019.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource,
UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    let nombreImagenes:[String] = ["aguila",
                                   "bufalo",
                                   "ciervo",
                                   "cocodrilo",
                                   "iguana",
                                    "leon",
                                    "oso",
                                    "snake",
                                    "tigre",
                                    "pantera"            ]
    
    @IBOutlet var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        collection.delegate = self
        collection.dataSource = self
        
       
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
     return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nombreImagenes.count
    }
    
    
    
    //---Funcion para que soluciomnar que queden mal las fotos por el espaciado al ponerle lo de paging enabled
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

//-----    Y ahora asigamos la imagen de la celda al nombre del fichero
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier:  "celdaCollection", for: indexPath)as! celdaImagen
       celda.image.image = UIImage(named: nombreImagenes[indexPath.row])
        celda.labelNombre.text = nombreImagenes[indexPath.row]
        celda.layer.cornerRadius = 10
        
        return celda
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tamanioPantalla = UIScreen.main.bounds
        let anchoCelda = (tamanioPantalla.width)*0.94
       return CGSize(width: anchoCelda, height: 220)
        // return CGSize(width: 100, height: 100)
    }
    // me dejo sin poner de la pag  58 carrusell fotos: Finalmente saber que existen estas funciones
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

