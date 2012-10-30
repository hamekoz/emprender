$(function () {
    var values = [],
        labels = [];
    $("tr.grafico").each(function () {
        values.push(parseInt($("td", this).text(), 10));
        labels.push("%%.%% " + $("th", this).text());
    });

    var x = screen.width,
        y = screen.height * 0.6,
        cx = x * 0.3,
        cy = y * 0.5,
        cr = x * 0.15,
        pos = "east";
    
    if (screen.height > screen.width) {
      x = screen.height;
      y = screen.width * 0.7;
      cx = x * 0.5;
      cy = y * 0.4;
      cr = x * 0.3;
      pos = "south";
    }

    var r = Raphael("contenedor-grafico", x , y)

    pie = r.piechart(cx, cy, cr, values, { legend: labels, legendothers: "Otros", legendpos : pos });

    pie.hover(function () {
        this.sector.stop();
        this.sector.scale(1.1, 1.1, this.cx, this.cy);

        if (this.label) {
            this.label[0].stop();
            this.label[0].attr({ r: 7.5 });
            this.label[1].attr({ "font-weight": 800 });
        }
    }, function () {
        this.sector.animate({ transform: 's1 1 ' + this.cx + ' ' + this.cy }, 500, "bounce");

        if (this.label) {
            this.label[0].animate({ r: 5 }, 500, "bounce");
            this.label[1].attr({ "font-weight": 400 });
        }
    });
});

