<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type=text/javascript>
        $(function() {
          $('a#test').bind('click', function() {
            $.getJSON('/last',
                function(data) {
                window.location = "output.jsp";
            });
            return false;
          });
        });
</script>


//button
<div class='container'>
    <h3>Test</h3>
        <form>
            <a href=# id=test><button class='btn btn-default'>Analyze Stress</button></a>
        </form>

</div>