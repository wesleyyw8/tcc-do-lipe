var baseUrl = "http://localhost:3001/endpoints";


function loadAssunto(serviceName){
  $.ajax({url: baseUrl+serviceName, success: function(result){
    console.log(result);

  }, error: function(err){
    console.log(err);  
  }});
}
function appendSelects(container, data){
  $.each(data, function(val,index){
    $(container).append($('<option>', { 
      value: val.id,
      text : val.value
    }));
  });
}

(function loadSelects(){
  var data = loadAssunto("/materia");
  $.each(data, function(val,index){
    appendSelects();
  });

  //loadAssunto("/classificacao");
})();