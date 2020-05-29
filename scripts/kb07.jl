using DrWatson

@quickactivate

using BenchmarkTools
using InteractiveUtils
using MixedModels

using MixedModels: dataset

kb07 = dataset(:kb07);
m1form = @formula(rt_trunc ~ 1 + spkr*prec*load + (1+spkr*prec*load|subj) + (1+spkr*prec*load|item));
contrasts = Dict(nm => HelmertCoding() for nm in (:spkr, :prec, :load));

@btime fit($MixedModel, $m1form, $kb07, contrasts=$contrasts)

print(stdout, versioninfo())
