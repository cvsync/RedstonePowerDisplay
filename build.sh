#! /bin/sh

VER_MAJOR=1
VER_MINOR=7

RESOURCE_PACK_NAME=RedstonePowerDisplay
PACK_FORMAT=6

SRCDIR=${RESOURCE_PACK_NAME}/assets/minecraft

TMPDIR=./tmp
TMPBASEDIR=${TMPDIR}/assets/minecraft

TEXTURES_BLOCKTARGET=block
TEXTURES_BLOCKDIR=${TMPBASEDIR}/textures/${TEXTURES_BLOCKTARGET}

#
# for Java Edition
#
RESOURCE_PACK_FILE_JAVA=${RESOURCE_PACK_NAME}.zip
rm -f ${RESOURCE_PACK_FILE_JAVA}
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR} ${TMPDIR}/assets ${TMPBASEDIR}
# blockstates
mkdir -p ${TMPBASEDIR}/blockstates
cat ${SRCDIR}/blockstates/redstone_wire.json | \
cat > ${TMPBASEDIR}/blockstates/redstone_wire.json
# models
mkdir -p ${TMPBASEDIR}/models ${TMPBASEDIR}/models/block
for _file in redstone_dust_dot redstone_dust_side redstone_dust_side_alt redstone_dust_side_alt0 redstone_dust_side_alt1 redstone_dust_side0 redstone_dust_side1 redstone_dust_up rs
do
	cat ${SRCDIR}/models/block/${_file}.json | \
	sed "s/XXBLOCKDIRXX/${TEXTURES_BLOCKTARGET}/g" | \
	cat > ${TMPBASEDIR}/models/block/${_file}.json
done
for _num in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15
do
	cat ${SRCDIR}/models/block/rsXX.json | \
	sed "s/XXBLOCKDIRXX/${TEXTURES_BLOCKTARGET}/g" | \
	sed "s/XXNUMXX/${_num}/g" | \
	cat > ${TMPBASEDIR}/models/block/rs${_num}.json
done
# textures
mkdir -p ${TMPBASEDIR}/textures ${TEXTURES_BLOCKDIR}
cp ${SRCDIR}/textures/blocks/* ${TEXTURES_BLOCKDIR}/

cp ${RESOURCE_PACK_NAME}/pack.png ${TMPDIR}/
cat ${RESOURCE_PACK_NAME}/pack.mcmeta | \
sed "s/XXXPACKFORMATXXX/${PACK_FORMAT}/g" | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
sed "s/XXXSUBSTRXXX//g" | \
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
for _file in redstone_dust_dot redstone_dust_side redstone_dust_side_alt redstone_dust_side_alt0 redstone_dust_side_alt1 redstone_dust_side0 redstone_dust_side1 redstone_dust_up rs
do
	cat ${SRCDIR}/models/block/${_file}.json | \
	sed "s/XXBLOCKDIRXX/${TEXTURES_BLOCKTARGET}/g" | \
	cat > ${TMPBASEDIR}/models/block/${_file}.json
done
for _num in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15
do
	cat ${SRCDIR}/models/block/rsXX.json | \
	sed "s/XXBLOCKDIRXX/${TEXTURES_BLOCKTARGET}/g" | \
	sed "s/XXNUMXX/${_num}/g" | \
	cat > ${TMPBASEDIR}/models/block/rs${_num}.json
done
# textures
mkdir -p ${TMPBASEDIR}/textures ${TEXTURES_BLOCKDIR}
cp ${SRCDIR}/textures/blocks/* ${TEXTURES_BLOCKDIR}/

cp ${RESOURCE_PACK_NAME}/pack_no_power_0.png ${TMPDIR}/pack.png
cat ${RESOURCE_PACK_NAME}/pack.mcmeta | \
sed "s/XXXPACKFORMATXXX/${PACK_FORMAT}/g" | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
sed "s/XXXSUBSTRXXX//g" | \
cat > ${TMPDIR}/pack.mcmeta
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_JAVA} *)
rm -f -r ${TMPDIR}

#
# for Java Edition (M+ hlv 12r)
#
RESOURCE_PACK_FILE_JAVA=${RESOURCE_PACK_NAME}_mplus_h12r.zip
rm -f ${RESOURCE_PACK_FILE_JAVA}
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR} ${TMPDIR}/assets ${TMPBASEDIR}
# blockstates
mkdir -p ${TMPBASEDIR}/blockstates
cat ${SRCDIR}/blockstates/redstone_wire.json | \
cat > ${TMPBASEDIR}/blockstates/redstone_wire.json
# models
mkdir -p ${TMPBASEDIR}/models ${TMPBASEDIR}/models/block
for _file in redstone_dust_dot redstone_dust_side redstone_dust_side_alt redstone_dust_side_alt0 redstone_dust_side_alt1 redstone_dust_side0 redstone_dust_side1 redstone_dust_up rs
do
	cat ${SRCDIR}/models/block/${_file}.json | \
	sed "s/XXBLOCKDIRXX/${TEXTURES_BLOCKTARGET}/g" | \
	cat > ${TMPBASEDIR}/models/block/${_file}.json
done
for _num in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15
do
	cat ${SRCDIR}/models/block/rsXX.json | \
	sed "s/XXBLOCKDIRXX/${TEXTURES_BLOCKTARGET}/g" | \
	sed "s/XXNUMXX/${_num}/g" | \
	cat > ${TMPBASEDIR}/models/block/rs${_num}.json
done
# textures
mkdir -p ${TMPBASEDIR}/textures ${TEXTURES_BLOCKDIR}
cp ${SRCDIR}/textures/blocks/* ${TEXTURES_BLOCKDIR}/
cp ${SRCDIR}/textures/mplus_h12r/*.png ${TEXTURES_BLOCKDIR}/

cp ${RESOURCE_PACK_NAME}/pack.png ${TMPDIR}/
cat ${RESOURCE_PACK_NAME}/pack.mcmeta | \
sed "s/XXXPACKFORMATXXX/${PACK_FORMAT}/g" | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
sed "s/XXXSUBSTRXXX/(M+ h12r) /g" | \
cat > ${TMPDIR}/pack.mcmeta
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_JAVA} *)
rm -f -r ${TMPDIR}

#
# for Java Edition (w/o 0) (M+ hlv 12r)
#
RESOURCE_PACK_FILE_JAVA=${RESOURCE_PACK_NAME}_NoPower0_mplus_h12r.zip
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
for _file in redstone_dust_dot redstone_dust_side redstone_dust_side_alt redstone_dust_side_alt0 redstone_dust_side_alt1 redstone_dust_side0 redstone_dust_side1 redstone_dust_up rs
do
	cat ${SRCDIR}/models/block/${_file}.json | \
	sed "s/XXBLOCKDIRXX/${TEXTURES_BLOCKTARGET}/g" | \
	cat > ${TMPBASEDIR}/models/block/${_file}.json
done
for _num in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15
do
	cat ${SRCDIR}/models/block/rsXX.json | \
	sed "s/XXBLOCKDIRXX/${TEXTURES_BLOCKTARGET}/g" | \
	sed "s/XXNUMXX/${_num}/g" | \
	cat > ${TMPBASEDIR}/models/block/rs${_num}.json
done
# textures
mkdir -p ${TMPBASEDIR}/textures ${TEXTURES_BLOCKDIR}
cp ${SRCDIR}/textures/blocks/* ${TEXTURES_BLOCKDIR}/
cp ${SRCDIR}/textures/mplus_h12r/*.png ${TEXTURES_BLOCKDIR}/

cp ${RESOURCE_PACK_NAME}/pack_no_power_0.png ${TMPDIR}/pack.png
cat ${RESOURCE_PACK_NAME}/pack.mcmeta | \
sed "s/XXXPACKFORMATXXX/${PACK_FORMAT}/g" | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
sed "s/XXXSUBSTRXXX/(M+ h12r) /g" | \
cat > ${TMPDIR}/pack.mcmeta
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_JAVA} *)
rm -f -r ${TMPDIR}
