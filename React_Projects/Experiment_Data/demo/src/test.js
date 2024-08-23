var reader = new FileReader();

reader.onload = function() {
    var text = reader.result;
    console.log(text);
}