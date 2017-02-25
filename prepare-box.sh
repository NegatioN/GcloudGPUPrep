# Download anaconda 2 if the file not present, and install.
if [ ! -f ${CONDA_FILE} ]; then
    wget https://repo.continuum.io/archive/${CONDA_FILE}
fi
bash ${CONDA_FILE} -b
echo 'export PATH="/home/${MY_LINUX_USER}/anaconda2/bin:$PATH"' >> ~/.bashrc
export PATH="/home/${MY_LINUX_USER}/anaconda2/bin:$PATH"
conda upgrade -y --all

# Install Theano and add default settings
pip install theano
echo "[global]
device = gpu
floatX = float32" > ~/.theanorc

# Install keras and add default settings
pip install keras
mkdir ~/.keras
echo '{
    "image_dim_ordering": "th",
    "epsilon": 1e-07,
    "floatx": "float32",
    "backend": "theano"
}' > ~/.keras/keras.json