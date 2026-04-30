// #define COMPILED

#if COMPILED
#r "../../src/Diffusion/bin/Debug/net10.0/Diffusion.Core.dll"
#r "../../src/Diffusion/bin/Debug/net10.0/Diffusion.Slycke.dll"
#else
#load "../../src/Diffusion.Numerics/TridiagonalSolver.fs"
#load "../../src/Diffusion.Numerics/NumericalUtilities.fs"
#load "../../src/Diffusion.Core/OperatingSystem.fs"
#load "../../src/Diffusion.Core/GnuplotHandler.fs"
#load "../../src/Diffusion.Core/ElementData.fs"
#load "../../src/Diffusion.Core/MixtureProperties.fs"
#load "../../src/Diffusion.Core/FunctionTypes.fs"
#load "../../src/Diffusion.Core/FvmDomain1D.fs"
#load "../../src/Diffusion.Core/DiffusionData1D.fs"
#load "../../src/Diffusion.Core/Carbonitriding1D.fs"
#load "../../src/Diffusion.Slycke/DiffusionPlainFeCN.fs"
#endif