plot_lm = function(response, factor, d = 1,
                   main = "", xlab = "Explanatory variable", ylab = "Response variable",
                   col = "black", bg = "black", l1.col = "red", l2.col = "black", pch = 21, cex = 1,
                   axes = T, ylim = NULL, xlim = NULL, mod.pos = "front"){
  n = length(response)/length(unique(factor))
  mod = lm(response ~ poly(factor, d, raw = T))
  s.mod = summary(mod) 
  r = s.mod$adj.r.squared
  
  f = summary(mod)$fstatistic
  p = pf(f[1],f[2],f[3],lower.tail=F)
  attributes(p) = NULL
  
    if (p < 0.001){p = "< 0.001"}else{p = paste(" = ",round(p,3))}
  fit.mod = as.data.frame(predict(mod, interval = "conf"))
  fit.mod$f = factor 
  fit.mod = fit.mod[order(fit.mod$f),]
 
  lm.plot = plot(y=response, x=factor, type = "n", xlab = xlab, ylab = ylab, pch = pch, bg = bg, cex = cex, col = col, 
                 main = paste(main), axes = axes, ylim = ylim, xlim = xlim)
  if (mod.pos == "front"){points(y=response, x=factor, pch = pch, bg = bg, cex = cex, col = col)}
  lines(fit.mod[,"lwr"] ~ fit.mod$f, col = l2.col, lty = 3, lwd = 2)
  lines(fit.mod[,"upr"] ~ fit.mod$f, col = l2.col, lty = 3, lwd = 2)
  lines(fit.mod[,"fit"] ~ fit.mod$f, col = l1.col, lty = 2, lwd = 3)
  if (mod.pos == "back"){points(y=response, x=factor, pch = pch, bg = bg, cex = cex, col = col)}
  
  
  print(paste("adj.r2 = ", round(r,3), sep = ""))
  print(paste("p.val ", p, sep = ""))
}
