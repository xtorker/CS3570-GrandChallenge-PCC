from algs_wrapper.base import Base

class Template(Base):
    def __init__(self):
        super().__init__()

    def make_encode_cmd(self, in_pcfile, bin_file):
        cmd = [
            self._algs_cfg['encoder'],
            
        ]
        
        return cmd

    def make_decode_cmd(self, bin_file, out_pcfile):
        cmd = [
            self._algs_cfg['decoder'],
            
        ]

        return cmd
