class Point {
    constructor(x, y, value, aa) {
        this.x = x;
        this.y = y;
        this.value = value;
        this.color = Point.darkenColor('#00a102', (1 - value));
        this.aa = aa;
    }

    static darkenColor(color, percent) {
        let parsedColor = parseInt(color.slice(1), 16),
            t = percent < 0 ? 0 : 255,
            R = parsedColor >> 16,
            G = parsedColor >> 8 & 0x00FF,
            B = parsedColor & 0x0000FF;
        return '#' + (0x1000000 +
            (Math.round((t - R) * percent) + R) * 0x10000 +
            (Math.round((t - G) * percent) + G) * 0x100 +
            (Math.round((t - B) * percent) + B))
            .toString(16).slice(1);
    }
}