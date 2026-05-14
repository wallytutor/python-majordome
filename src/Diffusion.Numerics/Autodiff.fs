[<AutoOpen>]
module Diffusion.Numerics.Autodiff

type Dual<'T> = 
    {
        Value: 'T
        Deriv: 'T
    }
    
    // Unary operations
    static member inline ( ~- ) (a: Dual< ^U >) = 
        {
            Value = -a.Value
            Deriv = -a.Deriv
        }

    // Dual-Dual arithmetic
    static member inline ( + ) (a: Dual< ^U >, b: Dual< ^U >) = 
        {
            Value = a.Value + b.Value
            Deriv = a.Deriv + b.Deriv
        }
    static member inline ( - ) (a: Dual< ^U >, b: Dual< ^U >) = 
        {
            Value = a.Value - b.Value
            Deriv = a.Deriv - b.Deriv
        }
    static member inline ( * ) (a: Dual< ^U >, b: Dual< ^U >) = 
        {
            Value = a.Value * b.Value
            Deriv = a.Deriv * b.Value + a.Value * b.Deriv
        }
    static member inline ( / ) (a: Dual< ^U >, b: Dual< ^U >) = 
        {
            Value = a.Value / b.Value
            Deriv = (a.Deriv * b.Value - a.Value * b.Deriv) / (b.Value * b.Value)
        }

    // Power operations
    static member inline Pow (a: Dual< ^U >, b: Dual< ^U >) =
        let v = a.Value ** b.Value
        let d = v * (b.Deriv * log a.Value + b.Value * a.Deriv / a.Value)
        {
            Value = v
            Deriv = d
        }

    // Standard math functions (F# inline math functions dispatch here via SRTP automatically)
    static member inline Sin  (x: Dual< ^U >) = 
        {
            Value = sin x.Value
            Deriv = cos x.Value * x.Deriv
        }
    static member inline Cos  (x: Dual< ^U >) = 
        {
            Value = cos x.Value
            Deriv = -sin x.Value * x.Deriv
        }
    static member inline Tan  (x: Dual< ^U >) = 
        {
            Value = tan x.Value
            Deriv = x.Deriv / (cos x.Value * cos x.Value)
        }
    static member inline Exp  (x: Dual< ^U >) = 
        let v = exp x.Value
        {
            Value = v
            Deriv = v * x.Deriv
        }
    static member inline Log  (x: Dual< ^U >) = 
        {
            Value = log x.Value
            Deriv = x.Deriv / x.Value
        }
    static member inline Sqrt (x: Dual< ^U >) = 
        let v = sqrt x.Value
        let two: ^U = LanguagePrimitives.GenericOne + LanguagePrimitives.GenericOne
        {
            Value = v
            Deriv = x.Deriv / (two * v)
        }
    static member inline Sinh (x: Dual< ^U >) = 
        {
            Value = sinh x.Value
            Deriv = cosh x.Value * x.Deriv
        }
    static member inline Cosh (x: Dual< ^U >) = 
        {
            Value = cosh x.Value
            Deriv = sinh x.Value * x.Deriv
        }
    static member inline Tanh (x: Dual< ^U >) = 
        let t = tanh x.Value
        let one: ^U = LanguagePrimitives.GenericOne
        {
            Value = t
            Deriv = (one - t * t) * x.Deriv
        }

// Float overloads to prevent F# from max iteration depth overflow
type Dual<'T> with
    // Dual-Float arithmetic
    static member ( + ) (a: Dual<float>, b: float) = 
        {
            Value = a.Value + b
            Deriv = a.Deriv
        }
    static member ( + ) (a: float, b: Dual<float>) = 
        {
            Value = a + b.Value
            Deriv = b.Deriv
        }
    static member ( - ) (a: Dual<float>, b: float) = 
        {
            Value = a.Value - b
            Deriv = a.Deriv
        }
    static member ( - ) (a: float, b: Dual<float>) = 
        {
            Value = a - b.Value
            Deriv = -b.Deriv
        }
    static member ( * ) (a: Dual<float>, b: float) = 
        {
            Value = a.Value * b
            Deriv = a.Deriv * b
        }
    static member ( * ) (a: float, b: Dual<float>) = 
        {
            Value = a * b.Value
            Deriv = a * b.Deriv
        }
    static member ( / ) (a: Dual<float>, b: float) = 
        {
            Value = a.Value / b
            Deriv = a.Deriv / b
        }
    static member ( / ) (a: float, b: Dual<float>) = 
        {
            Value = a / b.Value
            Deriv = (-a * b.Deriv) / (b.Value * b.Value)
        }
    static member Pow (a: Dual<float>, b: float) =
        {
            Value = a.Value ** b
            Deriv = b * (a.Value ** (b - 1.0)) * a.Deriv
        }
    static member Pow (a: float, b: Dual<float>) =
        let v = a ** b.Value
        {
            Value = v
            Deriv = v * log a * b.Deriv
        }

/// Lift a scalar into a Dual number (constant, no derivative)
let inline constant x = 
    {
        Value = x
        Deriv = LanguagePrimitives.GenericZero
    }

/// Create an active Dual variable (derivative is 1)
let inline variable x = 
    {
        Value = x
        Deriv = LanguagePrimitives.GenericOne
    }

/// Differentiate a function of 1 variable using Forward Mode AutoDiff
let inline diff f x =
    let res = f (variable x)
    res.Deriv
