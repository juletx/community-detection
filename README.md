# Community Detection - Bilaketa Heuristikoak

### Julen Etxaniz eta Aitor Zubillaga

Adimen Artifiziala modan dago, eta ikerlari asko ari dira egun, gai honetan ikerketzen. Hori dela eta, azken urteetan Machine Learning, Deep Learning, Big Data eta optimizazio metaheuristikoan ikaragarrizko produkzio zientifikoa eman da. Sortzen diren aurrerakuntza guztiak publikatu eta elkarbanatzeko asmotan, ehundaka konferentzia daude munduko herrialde desberdinetan. Hauetan, herrialde desberdinetako ikerlariak euren ikerketak azaltzeaz gain, kolaborazio desberdinak ematen dira.

Proiektu honetan, Neural Information Processing Systems (NIPS) kongresuan publikatzen duten autoreen komunitateak aztertu nahiko ditugu. Zehazki, 2014 eta 2015 urteen bitartean, kongresu honetan eman diren elkarlan komunitate desberdinak aurkitu nahi izango ditugu. 

Era asko daude komunitateak detektatzeko, baina proiektuaren helburua metaheuristikoak erabiltzea da. Horregatik NIPSeko elkarlan grafoa eraikiko dugu, eta komunitate kopuru maximo bat ezarrita, algoritmoak komunitate bakoitzean dauden autoreak (nodoak) zeintzuk diren esan beharko digu.

Proiektu honetan ondorengo ataza orokorrak gauzatu beharko ditugu.

* Kargatu NIPS datu baseko elkarlanak eta sortu elkarlan grafoa.
* Problema aztertu. Zenbat soluzio daude $n$ nodo eta $k$ komunitate dituen problema batean? Denak bideragarriak dira? Ez badira, zein dira bete behar diren murrizketak?
* Soluzioen kodeketa eta helburu-funtzioa. Nola adierazi daiteke problema honetarako soluzio bat? Zein da problemaren helburu-funtzioa?
* Algoritmoak. Proposatu gutxienez bi algoritmo problema ebazteko (bat bilaketa lokal erakoa eta bestea algoritmo poblazionalen taldekoa), eta egin dagozkien inplementazioak **liburutegirik erabili gabe**.
* Esperimentazioa. Probatu eta konparatu algoritmoak esku artean dugun problemaren gainean.
* Txostena. 4 orritako artikulu zientifiko bat idatzi beharko duzue garatu duzuen lana laburbilduz. Adi! 4 orri ez dira gehiegi. Overleaf-en editatu beharko duzue eta *IEEE Journal Paper Template* txantiloia erabiliz. Artikulu zientifiko egitura izan beharko du (laburpena, sarrera, problemaren azalpena, proposatutako algoritmoak, esperimentazioa, emaitzen analisia, eta ondorioak).