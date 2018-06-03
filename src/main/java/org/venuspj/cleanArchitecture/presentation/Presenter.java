package org.venuspj.cleanArchitecture.presentation;

import org.venuspj.cleanArchitecture.useCase.UseCaseOutputPort;

public interface Presenter<V extends View> extends UseCaseOutputPort {
    V createView();
}
