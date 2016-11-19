var baseUrl = "http://localhost:3001/endpoints";


function loadAssunto(serviceName, callback){
  $.ajax({url: baseUrl+serviceName, success: function(result){
    callback(result);
  }, error: function(err){
    console.log(err);  
  }});
}
function appendSelects(container, data){
  $.each(data.data, function(index,val){
    $(container).append($('<option>', { 
      value: val.id,
      text : val.value
    }));
  });
}

(function loadSelects(){
  loadAssunto("/materia", function(data){
    appendSelects('.assunto',data);
  });
  loadAssunto("/classificacao", function(data){
    appendSelects('.classificacaoEnsino',data);
  });
  loadAssunto("/tipo", function(data){
    appendSelects('.tipo',data);
  });
  loadAssunto("/ambiente", function(data){
    appendSelects('.ambiente',data);
  });
  loadAssunto("/porte", function(data){
    appendSelects('.porte',data);
  });
})();