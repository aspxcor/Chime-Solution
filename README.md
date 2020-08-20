# Chime-Solution
## Abstract
This is Part of the code in the reproduction process of Chime, the nsdi2020 conference paper.Some of the core algorithms used in Chime's reproduction work are given in the project warehouse

> paper: https://www.usenix.org/conference/nsdi20/presentation/gadre
> dataset: https://cmu.box.com/s/ftqnqywb0jnf4a3kl4si81uums5153h4 
## Overview of the Paper of Chime
Low-power Wide-Area Networks (LP-WANs) are seen as a leading candidate to network the Internet-of-Things at city-scale. Yet, the battery life and performance of LPWAN devices varies greatly based on their operating frequency. In multipath-rich urban environments, received signal power varies rapidly with a low-power transmitter’s frequency, impacting its transmission time, data rate and battery life. However, the low bandwidth of LP-WANs means that there are hundreds of operating frequencies to choose from. Among them, we show how choosing a select few of these frequencies(~3.55%) effectively triples the battery life when compared to the rest for LP-WAN devices.

This paper presents Chime, a system enabling LP-WAN base stations to identify an optimal frequency of operation after the client sends one packet at one frequency. Chime achieves this by analyzing the wireless channels of this packet across many base stations to disentangle multipath and ascertain an optimal frequency that maximizes client battery life and minimizes interference. We implement Chime on a campus-scale test-bed and achieve a median gain of 3.4 dB in SINR leading to a median increase in battery life of 230% (~1.4-5.7 years), data rate by 3.3x and reduction in interference of 2.8 over commodity LP-WANs.
