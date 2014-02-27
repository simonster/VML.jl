const base_unary = ((Base.acos, (-1, 1)),
                    (Base.asin, (-1, 1)),
                    (Base.atan, (-50, 50)),
                    (Base.cos, (-1000, 1000)),
                    (Base.sin, (-1000, 1000)),
                    (Base.tan, (-1000, 1000)),
                    (Base.acosh, (1, 1000)),
                    (Base.asinh, (-1000, 1000)),
                    (Base.cosh, (0, 89.415985f0)),
                    (Base.sinh, (-89.415985f0, 89.415985f0)),
                    (Base.tanh, (-8.66434f0, 8.66434f0)),
                    (Base.cbrt, (-1000, 1000)),
                    (Base.sqrt, (0, 1000)),
                    (Base.exp, (-88.72284f0, 88.72284f0)),
                    (Base.expm1, (-88.72284f0, 88.72284f0)),
                    (Base.log, (0, 1000)),
                    (Base.log10, (0, 1000)),
                    (Base.log1p, (-1, 1000)),
                    (Base.abs, (-1000, 1000)),
                    (Base.abs2, (-1000, 1000)),
                    (Base.ceil, (-1000, 1000)),
                    (Base.floor, (-1000, 1000)),
                    (Base.round, (-1000, 1000)),
                    (Base.trunc, (-1000, 1000)),
                    (Base.erf, (-3.8325067f0, 3.8325067f0)),
                    (Base.erfc, (-3.7439213f0, 10.019834f0)),
                    (Base.erfinv, (-1, 1)),
                    (Base.erfcinv, (0, 2)),
                    (Base.lgamma, (0, 1000)),
                    (Base.gamma, (0, 36)))

const base_binary = ((Base.atan2, (-1, 1), (-1, 1)),
                     (Base.hypot, (-1000, 1000), (-1000, 1000)),
                     (Base.(:.^), (0, 100), (-0.8590604f0, 19.265919f0)),
                     (Base.(:.+), (-1000, 1000), (-1000, 1000)),
                     (Base.(:./), (-1000, 1000), (-1000, 1000)),
                     (Base.(:.*), (-1000, 1000), (-1000, 1000)),
                     (Base.(:.-), (-1000, 1000), (-1000, 1000)))

function randindomain(t, n, domain)
    d1 = oftype(t, domain[1])
    d2 = oftype(t, domain[2])
    ddiff = d2 - d1
    @assert isfinite(ddiff)
    v = rand(t, n)
    for i = 1:length(v)
        v[i] = v[i]*ddiff+d1
    end
    v
end
