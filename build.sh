#! /bin/sh

VER_MAJOR=1
VER_MINOR=0

RESOURCE_PACK_NAME=RedstonePowerDisplay

RESOURCE_PACK_FILE_JAVA=${RESOURCE_PACK_NAME}.zip

SRCDIR=${RESOURCE_PACK_NAME}/assets/minecraft

TMPDIR=./tmp
TMPBASEDIR=${TMPDIR}/assets/minecraft

#
# for Java Edition
#
rm -f ${RESOURCE_PACK_FILE_JAVA}
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR} ${TMPDIR}/assets ${TMPBASEDIR}
# blockstates
mkdir -p ${TMPBASEDIR}/blockstates
cat ${SRCDIR}/blockstates/redstone_wire.json | \
cat > ${TMPBASEDIR}/blockstates/redstone_wire.json
# models
mkdir -p ${TMPBASEDIR}/models ${TMPBASEDIR}/models/block
for _file in redstone_dot rs
do
	cp ${SRCDIR}/models/block/${_file}.json ${TMPBASEDIR}/models/block/
done
for _num in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15
do
	cat ${SRCDIR}/models/block/rsXX.json | \
	sed "s/XXNUMXX/${_num}/g" | \
	cat > ${TMPBASEDIR}/models/block/rs${_num}.json
done
# textures
cp -R ${SRCDIR}/textures ${TMPBASEDIR}/

cp ${RESOURCE_PACK_NAME}/pack.png ${TMPDIR}/
cat ${RESOURCE_PACK_NAME}/pack.mcmeta | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
cat > ${TMPDIR}/pack.mcmeta
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_JAVA} *)
rm -f -r ${TMPDIR}

#
# for Java Edition (w/o 0)
#
RESOURCE_PACK_FILE_JAVA=${RESOURCE_PACK_NAME}_NoPower0.zip
rm -f ${RESOURCE_PACK_FILE_JAVA}
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR} ${TMPDIR}/assets ${TMPBASEDIR}
# blockstates
mkdir -p ${TMPBASEDIR}/blockstates
cat ${SRCDIR}/blockstates/redstone_wire.json | \
grep -v "rs00" | \
cat > ${TMPBASEDIR}/blockstates/redstone_wire.json
# models
mkdir -p ${TMPBASEDIR}/models ${TMPBASEDIR}/models/block
for _file in redstone_dot rs
do
	cp ${SRCDIR}/models/block/${_file}.json ${TMPBASEDIR}/models/block/
done
for _num in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15
do
	cat ${SRCDIR}/models/block/rsXX.json | \
	sed "s/XXNUMXX/${_num}/g" | \
	cat > ${TMPBASEDIR}/models/block/rs${_num}.json
done
# textures
cp -R ${SRCDIR}/textures ${TMPBASEDIR}/

cp ${RESOURCE_PACK_NAME}/pack.png ${TMPDIR}/
cat ${RESOURCE_PACK_NAME}/pack.mcmeta | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
cat > ${TMPDIR}/pack.mcmeta
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_JAVA} *)
rm -f -r ${TMPDIR}
