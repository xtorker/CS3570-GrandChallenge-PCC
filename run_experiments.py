import logging.config

from utils.file_io import get_logging_config
from algs_wrapper.Draco import Draco
from algs_wrapper.GeoCNNv2 import GeoCNNv2

def main():
    LOGGING_CONFIG = get_logging_config('utils/logging.conf')
    logging.config.dictConfig(LOGGING_CONFIG)

    draco = Draco()
    draco.debug = True
    draco.rate = 'r7'
    draco.run_dataset('Debug_SNC', 'experiments')

    geocnn_v2 = GeoCNNv2()
    geocnn_v2.debug = True
    geocnn_v2.rate = 'r3'
    geocnn_v2.run_dataset('Debug_SNC', 'experiments')


if __name__ == '__main__':
    main()
