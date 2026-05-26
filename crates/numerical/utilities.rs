pub fn pairwise_harmonic(x: f64, y: f64) -> f64 {
    2.0 * x * y / (x + y)
}

pub fn linear_space(start: f64, stop: f64, num: usize) -> Vec<f64> {
    if num == 0 {
        return vec![];
    }
    if num == 1 {
        return vec![start];
    }
    let step = (stop - start) / ((num - 1) as f64);
    (0..num).map(|i| start + (i as f64) * step).collect()
}

pub fn geometric_space(start: f64, stop: f64, num: usize, d0: f64, d1: f64) -> Vec<f64> {
    if num < 2 {
        panic!("num must be at least 2");
    }
    if d0 <= 0.0 {
        panic!("d0 must be positive");
    }
    if d1 <= 0.0 {
        panic!("d1 must be positive");
    }
    if num == 2 {
        return vec![start, stop];
    }
    let n_seg = num - 1;
    let ratio = (d1 / d0).powf(1.0 / ((n_seg - 1) as f64));
    let length = stop - start;

    if (1.0 - ratio).abs() < f64::EPSILON * 100.0 {
        return linear_space(start, stop, num);
    }

    let sum = d0 * (1.0 - ratio.powi(n_seg as i32)) / (1.0 - ratio);
    let mut points = vec![0.0; num];
    points[0] = start;

    let mut cumulative = 0.0;
    let mut segment = d0;

    for i in 1..=n_seg {
        cumulative += segment;
        points[i] = start + length * (cumulative / sum);
        segment *= ratio;
    }

    points[n_seg] = stop;
    points
}

pub fn arange_inclusive(start: f64, stop: f64, step: f64) -> Vec<f64> {
    if step == 0.0 {
        panic!("step must be non-zero");
    }
    if start == stop {
        return vec![start];
    }
    let span = stop - start;
    if span * step < 0.0 {
        panic!("step sign does not move from start toward stop");
    }

    let mut values = Vec::new();
    let eps = step.abs() * 1.0e-12 + 1.0e-15;
    let current = start;
    values.push(current);

    let keep_going = |x: f64| {
        if step > 0.0 {
            x <= stop + eps
        } else {
            x >= stop - eps
        }
    };

    let mut next = current + step;
    while keep_going(next) {
        values.push(next);
        next += step;
    }

    if (*values.last().unwrap() - stop).abs() > eps {
        values.push(stop);
    }

    values
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_pairwise_harmonic() {
        assert_eq!(pairwise_harmonic(2.0, 2.0), 2.0);
        assert_eq!(pairwise_harmonic(3.0, 6.0), 4.0);
    }

    #[test]
    fn test_linear_space() {
        let l = linear_space(0.0, 10.0, 3);
        assert_eq!(l.len(), 3);
        assert_eq!(l[0], 0.0);
        assert_eq!(l[1], 5.0);
        assert_eq!(l[2], 10.0);
    }

    #[test]
    fn test_arange_inclusive() {
        let a = arange_inclusive(0.0, 1.0, 0.5);
        assert_eq!(a.len(), 3);
        assert_eq!(a[0], 0.0);
        assert_eq!(a[1], 0.5);
        assert_eq!(a[2], 1.0);
    }
}
