

function Tornado(url) {

    var _url = url;


    this.align_reads = function(qc_project)
    {
	var resp = json_call_ajax_sync("Tornado.align_reads", [qc_project]);
//	var resp = json_call_sync("Tornado.align_reads", [qc_project]);
        return resp[0];
    }

    this.align_reads_async = function(qc_project, _callback, _error_callback)
    {
	json_call_ajax_async("Tornado.align_reads", [qc_project], 1, _callback, _error_callback)
    }

    this.preclustering = function(aligned_reads)
    {
	var resp = json_call_ajax_sync("Tornado.preclustering", [aligned_reads]);
//	var resp = json_call_sync("Tornado.preclustering", [aligned_reads]);
        return resp[0];
    }

    this.preclustering_async = function(aligned_reads, _callback, _error_callback)
    {
	json_call_ajax_async("Tornado.preclustering", [aligned_reads], 1, _callback, _error_callback)
    }

    this.link_otus = function(preclustered_reads)
    {
	var resp = json_call_ajax_sync("Tornado.link_otus", [preclustered_reads]);
//	var resp = json_call_sync("Tornado.link_otus", [preclustered_reads]);
        return resp[0];
    }

    this.link_otus_async = function(preclustered_reads, _callback, _error_callback)
    {
	json_call_ajax_async("Tornado.link_otus", [preclustered_reads], 1, _callback, _error_callback)
    }

    this.assign_taxonomy = function(aligned_reads)
    {
	var resp = json_call_ajax_sync("Tornado.assign_taxonomy", [aligned_reads]);
//	var resp = json_call_sync("Tornado.assign_taxonomy", [aligned_reads]);
        return resp[0];
    }

    this.assign_taxonomy_async = function(aligned_reads, _callback, _error_callback)
    {
	json_call_ajax_async("Tornado.assign_taxonomy", [aligned_reads], 1, _callback, _error_callback)
    }

    this.fastq_to_fasta = function(fastq_files)
    {
	var resp = json_call_ajax_sync("Tornado.fastq_to_fasta", [fastq_files]);
//	var resp = json_call_sync("Tornado.fastq_to_fasta", [fastq_files]);
        return resp;
    }

    this.fastq_to_fasta_async = function(fastq_files, _callback, _error_callback)
    {
	json_call_ajax_async("Tornado.fastq_to_fasta", [fastq_files], 2, _callback, _error_callback)
    }

    function _json_call_prepare(url, method, params, async_flag)
    {
	var rpc = { 'params' : params,
		    'method' : method,
		    'version': "1.1",
	};
	
	var body = JSON.stringify(rpc);
	
	var http = new XMLHttpRequest();
	
	http.open("POST", url, async_flag);
	
	//Send the proper header information along with the request
	http.setRequestHeader("Content-type", "application/json");
	//http.setRequestHeader("Content-length", body.length);
	//http.setRequestHeader("Connection", "close");
	return [http, body];
    }

    /*
     * JSON call using jQuery method.
     */

    function json_call_ajax_sync(method, params)
    {
        var rpc = { 'params' : params,
                    'method' : method,
                    'version': "1.1",
        };
        
        var body = JSON.stringify(rpc);
        var resp_txt;
	var code;
        
        var x = jQuery.ajax({       "async": false,
                                    dataType: "text",
                                    url: _url,
                                    success: function (data, status, xhr) { resp_txt = data; code = xhr.status },
				    error: function(xhr, textStatus, errorThrown) { resp_txt = xhr.responseText, code = xhr.status },
                                    data: body,
                                    processData: false,
                                    type: 'POST',
				    });

        var result;

        if (resp_txt)
        {
	    var resp = JSON.parse(resp_txt);
	    
	    if (code >= 500)
	    {
		throw resp.error;
	    }
	    else
	    {
		return resp.result;
	    }
        }
	else
	{
	    return null;
	}
    }

    function json_call_ajax_async(method, params, num_rets, callback, error_callback)
    {
        var rpc = { 'params' : params,
                    'method' : method,
                    'version': "1.1",
        };
        
        var body = JSON.stringify(rpc);
        var resp_txt;
	var code;
        
        var x = jQuery.ajax({       "async": true,
                                    dataType: "text",
                                    url: _url,
                                    success: function (data, status, xhr)
				{
				    resp = JSON.parse(data);
				    var result = resp["result"];
				    if (num_rets == 1)
				    {
					callback(result[0]);
				    }
				    else
				    {
					callback(result);
				    }
				    
				},
				    error: function(xhr, textStatus, errorThrown)
				{
				    if (xhr.responseText)
				    {
					resp = JSON.parse(xhr.responseText);
					if (error_callback)
					{
					    error_callback(resp.error);
					}
					else
					{
					    throw resp.error;
					}
				    }
				},
                                    data: body,
                                    processData: false,
                                    type: 'POST',
				    });

    }

    function json_call_async(method, params, num_rets, callback)
    {
	var tup = _json_call_prepare(_url, method, params, true);
	var http = tup[0];
	var body = tup[1];
	
	http.onreadystatechange = function() {
	    if (http.readyState == 4 && http.status == 200) {
		var resp_txt = http.responseText;
		var resp = JSON.parse(resp_txt);
		var result = resp["result"];
		if (num_rets == 1)
		{
		    callback(result[0]);
		}
		else
		{
		    callback(result);
		}
	    }
	}
	
	http.send(body);
	
    }
    
    function json_call_sync(method, params)
    {
	var tup = _json_call_prepare(url, method, params, false);
	var http = tup[0];
	var body = tup[1];
	
	http.send(body);
	
	var resp_txt = http.responseText;
	
	var resp = JSON.parse(resp_txt);
	var result = resp["result"];
	    
	return result;
    }
}

