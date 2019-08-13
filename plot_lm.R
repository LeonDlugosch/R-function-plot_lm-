plot_lm = function(resp.data, expl.data, d = 1,
                   main = "", xlab = "Explanatory variable", ylab = "Response variable",
                   col = "black", bg = "black", l1.col = "red", l2.col = "black", pch = 21, cex = 1, las = 2, lty = 2, lwd = 2, 
                   axes = TRUE, ylim = NULL, xlim = NULL, mod.pos = "front", plot.result = NULL, add = FALSE, predict = TRUE){
  n = length(resp.data)/length(unique(expl.data))
  mod = lm(resp.data ~ poly(expl.data, d, raw = T))
  s.mod = summary(mod) 
  r = s.mod$adj.r.squared
  
  f = summary(mod)$fstatistic
  p = pf(f[1],f[2],f[3],lower.tail=F)
  attributes(p) = NULL
  
  if(p < 0.001){p = "< 0.001"}else{p = paste(" = ",round(p,3))}
  fit.mod = as.data.frame(predict(mod, interval = "conf"))
  fit.mod$f = expl.data
  fit.mod = fit.mod[order(fit.mod$f),]
  if(add == FALSE){
    lm.plot = plot(y=resp.data, x=expl.data, type = "n", xlab = xlab, ylab = ylab, pch = pch, bg = bg, cex = cex, col = col, 
                   main = paste(main), axes = axes, ylim = ylim, xlim = xlim, las = las)
  }
  if(mod.pos == "front"){points(y=resp.data, x=expl.data, pch = pch, bg = bg, cex = cex, col = col)}
  if(predict == TRUE){
    lines(fit.mod[,"lwr"] ~ fit.mod$f, col = l2.col, lty = 3, lwd = 2)
    lines(fit.mod[,"upr"] ~ fit.mod$f, col = l2.col, lty = 3, lwd = 2)
  }
  lines(fit.mod[,"fit"] ~ fit.mod$f, col = l1.col, lty = lty, lwd = 3)
  if(mod.pos == "back"){points(y=resp.data, x=expl.data, pch = pch, bg = bg, cex = cex, col = col)}
  if(!is.null(plot.result)){
    text = paste(paste("adj.r2 = ", round(r,3),", ", sep = ""), paste("p.val ", p, sep = ""))
    legend(plot.result, bty = "n", legend = text)
  }
  
  
  print(paste("adj.r2 = ", round(r,3), sep = ""))
  print(paste("p.val ", p, sep = ""))
}