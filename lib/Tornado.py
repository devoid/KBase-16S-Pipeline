try:
    import json
except ImportError:
    import sys
    sys.path.append('simplejson-2.3.3')
    import simplejson as json
    
import urllib



class Tornado:

    def __init__(self, url):
        if url != None:
            self.url = url

    def align_reads(self, qc_project):

        arg_hash = { 'method': 'Tornado.align_reads',
                     'params': [qc_project],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def preclustering(self, aligned_reads):

        arg_hash = { 'method': 'Tornado.preclustering',
                     'params': [aligned_reads],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def link_otus(self, preclustered_reads):

        arg_hash = { 'method': 'Tornado.link_otus',
                     'params': [preclustered_reads],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def assign_taxonomy(self, aligned_reads):

        arg_hash = { 'method': 'Tornado.assign_taxonomy',
                     'params': [aligned_reads],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def fastq_to_fasta(self, fastq_files):

        arg_hash = { 'method': 'Tornado.fastq_to_fasta',
                     'params': [fastq_files],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result']
        else:
            return None




        
